# Explore: explore_1973
# Auto-generated LookML Explore File

include: "/views/domain_20/view_05920.view.lkml"
include: "/views/domain_22/view_05922.view.lkml"
include: "/views/domain_23/view_05923.view.lkml"
include: "/views/domain_24/view_05924.view.lkml"

explore: explore_1973 {
  label: "Explore Explore 1973"
  description: "Comprehensive analytics explore joining base view_05920 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05920
  
  always_filter: {
    filters: [view_05920.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05920.created_at_date: "7 days"]
    unless: [view_05920.id, view_05920.status]
  }

  join: view_05922 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05920.user_id} = ${view_05922.id} ;;
    required_joins: []
  }

  join: view_05923 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05920.account_id} = ${view_05923.account_id} ;;
    required_joins: [view_05922]
  }

  join: view_05924 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05920.category} = ${view_05924.category} ;;
  }

  access_filter: {
    field: view_05920.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05920.is_deleted} = false ;;
}
