# Explore: explore_3987
# Auto-generated LookML Explore File

include: "/views/domain_12/view_11962.view.lkml"
include: "/views/domain_14/view_11964.view.lkml"
include: "/views/domain_15/view_11965.view.lkml"
include: "/views/domain_16/view_11966.view.lkml"

explore: explore_3987 {
  label: "Explore Explore 3987"
  description: "Comprehensive analytics explore joining base view_11962 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11962
  
  always_filter: {
    filters: [view_11962.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11962.created_at_date: "7 days"]
    unless: [view_11962.id, view_11962.status]
  }

  join: view_11964 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11962.user_id} = ${view_11964.id} ;;
    required_joins: []
  }

  join: view_11965 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11962.account_id} = ${view_11965.account_id} ;;
    required_joins: [view_11964]
  }

  join: view_11966 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11962.category} = ${view_11966.category} ;;
  }

  access_filter: {
    field: view_11962.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11962.is_deleted} = false ;;
}
