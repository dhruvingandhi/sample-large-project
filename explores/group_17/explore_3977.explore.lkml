# Update for 2000 file diff target
# Explore: explore_3977
# Auto-generated LookML Explore File

include: "/views/domain_32/view_11932.view.lkml"
include: "/views/domain_34/view_11934.view.lkml"
include: "/views/domain_35/view_11935.view.lkml"
include: "/views/domain_36/view_11936.view.lkml"

explore: explore_3977 {
  label: "Explore Explore 3977"
  description: "Comprehensive analytics explore joining base view_11932 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11932
  
  always_filter: {
    filters: [view_11932.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11932.created_at_date: "7 days"]
    unless: [view_11932.id, view_11932.status]
  }

  join: view_11934 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11932.user_id} = ${view_11934.id} ;;
    required_joins: []
  }

  join: view_11935 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11932.account_id} = ${view_11935.account_id} ;;
    required_joins: [view_11934]
  }

  join: view_11936 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11932.category} = ${view_11936.category} ;;
  }

  access_filter: {
    field: view_11932.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11932.is_deleted} = false ;;
}
