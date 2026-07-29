# Explore: explore_0987
# Auto-generated LookML Explore File

include: "/views/domain_12/view_02962.view.lkml"
include: "/views/domain_14/view_02964.view.lkml"
include: "/views/domain_15/view_02965.view.lkml"
include: "/views/domain_16/view_02966.view.lkml"

explore: explore_0987 {
  label: "Explore Explore 0987"
  description: "Comprehensive analytics explore joining base view_02962 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02962
  
  always_filter: {
    filters: [view_02962.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02962.created_at_date: "7 days"]
    unless: [view_02962.id, view_02962.status]
  }

  join: view_02964 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02962.user_id} = ${view_02964.id} ;;
    required_joins: []
  }

  join: view_02965 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02962.account_id} = ${view_02965.account_id} ;;
    required_joins: [view_02964]
  }

  join: view_02966 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02962.category} = ${view_02966.category} ;;
  }

  access_filter: {
    field: view_02962.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02962.is_deleted} = false ;;
}
