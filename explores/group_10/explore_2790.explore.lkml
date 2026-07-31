# Update for 2000 file diff target
# Explore: explore_2790
# Auto-generated LookML Explore File

include: "/views/domain_21/view_08371.view.lkml"
include: "/views/domain_23/view_08373.view.lkml"
include: "/views/domain_24/view_08374.view.lkml"
include: "/views/domain_25/view_08375.view.lkml"

explore: explore_2790 {
  label: "Explore Explore 2790"
  description: "Comprehensive analytics explore joining base view_08371 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08371
  
  always_filter: {
    filters: [view_08371.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08371.created_at_date: "7 days"]
    unless: [view_08371.id, view_08371.status]
  }

  join: view_08373 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08371.user_id} = ${view_08373.id} ;;
    required_joins: []
  }

  join: view_08374 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08371.account_id} = ${view_08374.account_id} ;;
    required_joins: [view_08373]
  }

  join: view_08375 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08371.category} = ${view_08375.category} ;;
  }

  access_filter: {
    field: view_08371.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08371.is_deleted} = false ;;
}
