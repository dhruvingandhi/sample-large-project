# Explore: explore_1288
# Auto-generated LookML Explore File

include: "/views/domain_15/view_03865.view.lkml"
include: "/views/domain_17/view_03867.view.lkml"
include: "/views/domain_18/view_03868.view.lkml"
include: "/views/domain_19/view_03869.view.lkml"

explore: explore_1288 {
  label: "Explore Explore 1288"
  description: "Comprehensive analytics explore joining base view_03865 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03865
  
  always_filter: {
    filters: [view_03865.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03865.created_at_date: "7 days"]
    unless: [view_03865.id, view_03865.status]
  }

  join: view_03867 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03865.user_id} = ${view_03867.id} ;;
    required_joins: []
  }

  join: view_03868 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03865.account_id} = ${view_03868.account_id} ;;
    required_joins: [view_03867]
  }

  join: view_03869 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03865.category} = ${view_03869.category} ;;
  }

  access_filter: {
    field: view_03865.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03865.is_deleted} = false ;;
}
