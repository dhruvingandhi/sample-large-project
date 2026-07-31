# Update for 2000 file diff target
# Explore: explore_1900
# Auto-generated LookML Explore File

include: "/views/domain_01/view_05701.view.lkml"
include: "/views/domain_03/view_05703.view.lkml"
include: "/views/domain_04/view_05704.view.lkml"
include: "/views/domain_05/view_05705.view.lkml"

explore: explore_1900 {
  label: "Explore Explore 1900"
  description: "Comprehensive analytics explore joining base view_05701 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05701
  
  always_filter: {
    filters: [view_05701.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05701.created_at_date: "7 days"]
    unless: [view_05701.id, view_05701.status]
  }

  join: view_05703 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05701.user_id} = ${view_05703.id} ;;
    required_joins: []
  }

  join: view_05704 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05701.account_id} = ${view_05704.account_id} ;;
    required_joins: [view_05703]
  }

  join: view_05705 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05701.category} = ${view_05705.category} ;;
  }

  access_filter: {
    field: view_05701.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05701.is_deleted} = false ;;
}
