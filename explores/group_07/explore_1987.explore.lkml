# Explore: explore_1987
# Auto-generated LookML Explore File

include: "/views/domain_12/view_05962.view.lkml"
include: "/views/domain_14/view_05964.view.lkml"
include: "/views/domain_15/view_05965.view.lkml"
include: "/views/domain_16/view_05966.view.lkml"

explore: explore_1987 {
  label: "Explore Explore 1987"
  description: "Comprehensive analytics explore joining base view_05962 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05962
  
  always_filter: {
    filters: [view_05962.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05962.created_at_date: "7 days"]
    unless: [view_05962.id, view_05962.status]
  }

  join: view_05964 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05962.user_id} = ${view_05964.id} ;;
    required_joins: []
  }

  join: view_05965 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05962.account_id} = ${view_05965.account_id} ;;
    required_joins: [view_05964]
  }

  join: view_05966 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05962.category} = ${view_05966.category} ;;
  }

  access_filter: {
    field: view_05962.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05962.is_deleted} = false ;;
}
