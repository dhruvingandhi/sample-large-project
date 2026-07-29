# Explore: explore_3971
# Auto-generated LookML Explore File

include: "/views/domain_14/view_11914.view.lkml"
include: "/views/domain_16/view_11916.view.lkml"
include: "/views/domain_17/view_11917.view.lkml"
include: "/views/domain_18/view_11918.view.lkml"

explore: explore_3971 {
  label: "Explore Explore 3971"
  description: "Comprehensive analytics explore joining base view_11914 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11914
  
  always_filter: {
    filters: [view_11914.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11914.created_at_date: "7 days"]
    unless: [view_11914.id, view_11914.status]
  }

  join: view_11916 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11914.user_id} = ${view_11916.id} ;;
    required_joins: []
  }

  join: view_11917 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11914.account_id} = ${view_11917.account_id} ;;
    required_joins: [view_11916]
  }

  join: view_11918 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11914.category} = ${view_11918.category} ;;
  }

  access_filter: {
    field: view_11914.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11914.is_deleted} = false ;;
}
