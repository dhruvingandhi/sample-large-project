# Explore: explore_1291
# Auto-generated LookML Explore File

include: "/views/domain_24/view_03874.view.lkml"
include: "/views/domain_26/view_03876.view.lkml"
include: "/views/domain_27/view_03877.view.lkml"
include: "/views/domain_28/view_03878.view.lkml"

explore: explore_1291 {
  label: "Explore Explore 1291"
  description: "Comprehensive analytics explore joining base view_03874 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03874
  
  always_filter: {
    filters: [view_03874.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03874.created_at_date: "7 days"]
    unless: [view_03874.id, view_03874.status]
  }

  join: view_03876 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03874.user_id} = ${view_03876.id} ;;
    required_joins: []
  }

  join: view_03877 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03874.account_id} = ${view_03877.account_id} ;;
    required_joins: [view_03876]
  }

  join: view_03878 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03874.category} = ${view_03878.category} ;;
  }

  access_filter: {
    field: view_03874.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03874.is_deleted} = false ;;
}
