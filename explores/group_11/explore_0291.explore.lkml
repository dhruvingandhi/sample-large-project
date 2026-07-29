# Explore: explore_0291
# Auto-generated LookML Explore File

include: "/views/domain_24/view_00874.view.lkml"
include: "/views/domain_26/view_00876.view.lkml"
include: "/views/domain_27/view_00877.view.lkml"
include: "/views/domain_28/view_00878.view.lkml"

explore: explore_0291 {
  label: "Explore Explore 0291"
  description: "Comprehensive analytics explore joining base view_00874 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00874
  
  always_filter: {
    filters: [view_00874.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00874.created_at_date: "7 days"]
    unless: [view_00874.id, view_00874.status]
  }

  join: view_00876 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00874.user_id} = ${view_00876.id} ;;
    required_joins: []
  }

  join: view_00877 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00874.account_id} = ${view_00877.account_id} ;;
    required_joins: [view_00876]
  }

  join: view_00878 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00874.category} = ${view_00878.category} ;;
  }

  access_filter: {
    field: view_00874.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00874.is_deleted} = false ;;
}
