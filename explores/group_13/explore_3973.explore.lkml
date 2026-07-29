# Explore: explore_3973
# Auto-generated LookML Explore File

include: "/views/domain_20/view_11920.view.lkml"
include: "/views/domain_22/view_11922.view.lkml"
include: "/views/domain_23/view_11923.view.lkml"
include: "/views/domain_24/view_11924.view.lkml"

explore: explore_3973 {
  label: "Explore Explore 3973"
  description: "Comprehensive analytics explore joining base view_11920 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11920
  
  always_filter: {
    filters: [view_11920.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11920.created_at_date: "7 days"]
    unless: [view_11920.id, view_11920.status]
  }

  join: view_11922 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11920.user_id} = ${view_11922.id} ;;
    required_joins: []
  }

  join: view_11923 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11920.account_id} = ${view_11923.account_id} ;;
    required_joins: [view_11922]
  }

  join: view_11924 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11920.category} = ${view_11924.category} ;;
  }

  access_filter: {
    field: view_11920.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11920.is_deleted} = false ;;
}
