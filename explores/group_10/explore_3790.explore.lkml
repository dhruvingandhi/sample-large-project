# Explore: explore_3790
# Auto-generated LookML Explore File

include: "/views/domain_21/view_11371.view.lkml"
include: "/views/domain_23/view_11373.view.lkml"
include: "/views/domain_24/view_11374.view.lkml"
include: "/views/domain_25/view_11375.view.lkml"

explore: explore_3790 {
  label: "Explore Explore 3790"
  description: "Comprehensive analytics explore joining base view_11371 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11371
  
  always_filter: {
    filters: [view_11371.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11371.created_at_date: "7 days"]
    unless: [view_11371.id, view_11371.status]
  }

  join: view_11373 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11371.user_id} = ${view_11373.id} ;;
    required_joins: []
  }

  join: view_11374 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11371.account_id} = ${view_11374.account_id} ;;
    required_joins: [view_11373]
  }

  join: view_11375 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11371.category} = ${view_11375.category} ;;
  }

  access_filter: {
    field: view_11371.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11371.is_deleted} = false ;;
}
