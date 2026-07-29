# Explore: explore_0929
# Auto-generated LookML Explore File

include: "/views/domain_38/view_02788.view.lkml"
include: "/views/domain_40/view_02790.view.lkml"
include: "/views/domain_41/view_02791.view.lkml"
include: "/views/domain_42/view_02792.view.lkml"

explore: explore_0929 {
  label: "Explore Explore 0929"
  description: "Comprehensive analytics explore joining base view_02788 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02788
  
  always_filter: {
    filters: [view_02788.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02788.created_at_date: "7 days"]
    unless: [view_02788.id, view_02788.status]
  }

  join: view_02790 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02788.user_id} = ${view_02790.id} ;;
    required_joins: []
  }

  join: view_02791 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02788.account_id} = ${view_02791.account_id} ;;
    required_joins: [view_02790]
  }

  join: view_02792 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02788.category} = ${view_02792.category} ;;
  }

  access_filter: {
    field: view_02788.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02788.is_deleted} = false ;;
}
