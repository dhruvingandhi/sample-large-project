# Explore: explore_0957
# Auto-generated LookML Explore File

include: "/views/domain_22/view_02872.view.lkml"
include: "/views/domain_24/view_02874.view.lkml"
include: "/views/domain_25/view_02875.view.lkml"
include: "/views/domain_26/view_02876.view.lkml"

explore: explore_0957 {
  label: "Explore Explore 0957"
  description: "Comprehensive analytics explore joining base view_02872 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02872
  
  always_filter: {
    filters: [view_02872.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02872.created_at_date: "7 days"]
    unless: [view_02872.id, view_02872.status]
  }

  join: view_02874 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02872.user_id} = ${view_02874.id} ;;
    required_joins: []
  }

  join: view_02875 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02872.account_id} = ${view_02875.account_id} ;;
    required_joins: [view_02874]
  }

  join: view_02876 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02872.category} = ${view_02876.category} ;;
  }

  access_filter: {
    field: view_02872.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02872.is_deleted} = false ;;
}
