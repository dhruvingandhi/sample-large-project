# Explore: explore_3596
# Auto-generated LookML Explore File

include: "/views/domain_39/view_10789.view.lkml"
include: "/views/domain_41/view_10791.view.lkml"
include: "/views/domain_42/view_10792.view.lkml"
include: "/views/domain_43/view_10793.view.lkml"

explore: explore_3596 {
  label: "Explore Explore 3596"
  description: "Comprehensive analytics explore joining base view_10789 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10789
  
  always_filter: {
    filters: [view_10789.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10789.created_at_date: "7 days"]
    unless: [view_10789.id, view_10789.status]
  }

  join: view_10791 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10789.user_id} = ${view_10791.id} ;;
    required_joins: []
  }

  join: view_10792 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10789.account_id} = ${view_10792.account_id} ;;
    required_joins: [view_10791]
  }

  join: view_10793 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10789.category} = ${view_10793.category} ;;
  }

  access_filter: {
    field: view_10789.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10789.is_deleted} = false ;;
}
