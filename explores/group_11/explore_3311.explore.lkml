# Explore: explore_3311
# Auto-generated LookML Explore File

include: "/views/domain_34/view_09934.view.lkml"
include: "/views/domain_36/view_09936.view.lkml"
include: "/views/domain_37/view_09937.view.lkml"
include: "/views/domain_38/view_09938.view.lkml"

explore: explore_3311 {
  label: "Explore Explore 3311"
  description: "Comprehensive analytics explore joining base view_09934 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09934
  
  always_filter: {
    filters: [view_09934.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09934.created_at_date: "7 days"]
    unless: [view_09934.id, view_09934.status]
  }

  join: view_09936 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09934.user_id} = ${view_09936.id} ;;
    required_joins: []
  }

  join: view_09937 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09934.account_id} = ${view_09937.account_id} ;;
    required_joins: [view_09936]
  }

  join: view_09938 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09934.category} = ${view_09938.category} ;;
  }

  access_filter: {
    field: view_09934.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09934.is_deleted} = false ;;
}
