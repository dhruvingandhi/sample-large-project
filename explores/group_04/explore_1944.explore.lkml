# Explore: explore_1944
# Auto-generated LookML Explore File

include: "/views/domain_33/view_05833.view.lkml"
include: "/views/domain_35/view_05835.view.lkml"
include: "/views/domain_36/view_05836.view.lkml"
include: "/views/domain_37/view_05837.view.lkml"

explore: explore_1944 {
  label: "Explore Explore 1944"
  description: "Comprehensive analytics explore joining base view_05833 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05833
  
  always_filter: {
    filters: [view_05833.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05833.created_at_date: "7 days"]
    unless: [view_05833.id, view_05833.status]
  }

  join: view_05835 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05833.user_id} = ${view_05835.id} ;;
    required_joins: []
  }

  join: view_05836 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05833.account_id} = ${view_05836.account_id} ;;
    required_joins: [view_05835]
  }

  join: view_05837 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05833.category} = ${view_05837.category} ;;
  }

  access_filter: {
    field: view_05833.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05833.is_deleted} = false ;;
}
