# Explore: explore_1916
# Auto-generated LookML Explore File

include: "/views/domain_49/view_05749.view.lkml"
include: "/views/domain_01/view_05751.view.lkml"
include: "/views/domain_02/view_05752.view.lkml"
include: "/views/domain_03/view_05753.view.lkml"

explore: explore_1916 {
  label: "Explore Explore 1916"
  description: "Comprehensive analytics explore joining base view_05749 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05749
  
  always_filter: {
    filters: [view_05749.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05749.created_at_date: "7 days"]
    unless: [view_05749.id, view_05749.status]
  }

  join: view_05751 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05749.user_id} = ${view_05751.id} ;;
    required_joins: []
  }

  join: view_05752 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05749.account_id} = ${view_05752.account_id} ;;
    required_joins: [view_05751]
  }

  join: view_05753 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05749.category} = ${view_05753.category} ;;
  }

  access_filter: {
    field: view_05749.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05749.is_deleted} = false ;;
}
