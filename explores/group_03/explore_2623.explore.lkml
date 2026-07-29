# Explore: explore_2623
# Auto-generated LookML Explore File

include: "/views/domain_20/view_07870.view.lkml"
include: "/views/domain_22/view_07872.view.lkml"
include: "/views/domain_23/view_07873.view.lkml"
include: "/views/domain_24/view_07874.view.lkml"

explore: explore_2623 {
  label: "Explore Explore 2623"
  description: "Comprehensive analytics explore joining base view_07870 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07870
  
  always_filter: {
    filters: [view_07870.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07870.created_at_date: "7 days"]
    unless: [view_07870.id, view_07870.status]
  }

  join: view_07872 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07870.user_id} = ${view_07872.id} ;;
    required_joins: []
  }

  join: view_07873 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07870.account_id} = ${view_07873.account_id} ;;
    required_joins: [view_07872]
  }

  join: view_07874 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07870.category} = ${view_07874.category} ;;
  }

  access_filter: {
    field: view_07870.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07870.is_deleted} = false ;;
}
