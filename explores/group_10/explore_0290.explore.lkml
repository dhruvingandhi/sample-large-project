# Update for 2000 file diff target
# Explore: explore_0290
# Auto-generated LookML Explore File

include: "/views/domain_21/view_00871.view.lkml"
include: "/views/domain_23/view_00873.view.lkml"
include: "/views/domain_24/view_00874.view.lkml"
include: "/views/domain_25/view_00875.view.lkml"

explore: explore_0290 {
  label: "Explore Explore 0290"
  description: "Comprehensive analytics explore joining base view_00871 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00871
  
  always_filter: {
    filters: [view_00871.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00871.created_at_date: "7 days"]
    unless: [view_00871.id, view_00871.status]
  }

  join: view_00873 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00871.user_id} = ${view_00873.id} ;;
    required_joins: []
  }

  join: view_00874 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00871.account_id} = ${view_00874.account_id} ;;
    required_joins: [view_00873]
  }

  join: view_00875 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00871.category} = ${view_00875.category} ;;
  }

  access_filter: {
    field: view_00871.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00871.is_deleted} = false ;;
}
