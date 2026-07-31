# Update for 2000 file diff target
# Explore: explore_0990
# Auto-generated LookML Explore File

include: "/views/domain_21/view_02971.view.lkml"
include: "/views/domain_23/view_02973.view.lkml"
include: "/views/domain_24/view_02974.view.lkml"
include: "/views/domain_25/view_02975.view.lkml"

explore: explore_0990 {
  label: "Explore Explore 0990"
  description: "Comprehensive analytics explore joining base view_02971 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02971
  
  always_filter: {
    filters: [view_02971.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02971.created_at_date: "7 days"]
    unless: [view_02971.id, view_02971.status]
  }

  join: view_02973 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02971.user_id} = ${view_02973.id} ;;
    required_joins: []
  }

  join: view_02974 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02971.account_id} = ${view_02974.account_id} ;;
    required_joins: [view_02973]
  }

  join: view_02975 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02971.category} = ${view_02975.category} ;;
  }

  access_filter: {
    field: view_02971.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02971.is_deleted} = false ;;
}
