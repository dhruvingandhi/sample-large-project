# Explore: explore_2349
# Auto-generated LookML Explore File

include: "/views/domain_48/view_07048.view.lkml"
include: "/views/domain_50/view_07050.view.lkml"
include: "/views/domain_01/view_07051.view.lkml"
include: "/views/domain_02/view_07052.view.lkml"

explore: explore_2349 {
  label: "Explore Explore 2349"
  description: "Comprehensive analytics explore joining base view_07048 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07048
  
  always_filter: {
    filters: [view_07048.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07048.created_at_date: "7 days"]
    unless: [view_07048.id, view_07048.status]
  }

  join: view_07050 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07048.user_id} = ${view_07050.id} ;;
    required_joins: []
  }

  join: view_07051 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07048.account_id} = ${view_07051.account_id} ;;
    required_joins: [view_07050]
  }

  join: view_07052 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07048.category} = ${view_07052.category} ;;
  }

  access_filter: {
    field: view_07048.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07048.is_deleted} = false ;;
}
