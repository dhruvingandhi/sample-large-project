# Explore: explore_0623
# Auto-generated LookML Explore File

include: "/views/domain_20/view_01870.view.lkml"
include: "/views/domain_22/view_01872.view.lkml"
include: "/views/domain_23/view_01873.view.lkml"
include: "/views/domain_24/view_01874.view.lkml"

explore: explore_0623 {
  label: "Explore Explore 0623"
  description: "Comprehensive analytics explore joining base view_01870 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01870
  
  always_filter: {
    filters: [view_01870.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01870.created_at_date: "7 days"]
    unless: [view_01870.id, view_01870.status]
  }

  join: view_01872 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01870.user_id} = ${view_01872.id} ;;
    required_joins: []
  }

  join: view_01873 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01870.account_id} = ${view_01873.account_id} ;;
    required_joins: [view_01872]
  }

  join: view_01874 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01870.category} = ${view_01874.category} ;;
  }

  access_filter: {
    field: view_01870.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01870.is_deleted} = false ;;
}
