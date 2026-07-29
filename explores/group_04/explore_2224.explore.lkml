# Explore: explore_2224
# Auto-generated LookML Explore File

include: "/views/domain_23/view_06673.view.lkml"
include: "/views/domain_25/view_06675.view.lkml"
include: "/views/domain_26/view_06676.view.lkml"
include: "/views/domain_27/view_06677.view.lkml"

explore: explore_2224 {
  label: "Explore Explore 2224"
  description: "Comprehensive analytics explore joining base view_06673 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06673
  
  always_filter: {
    filters: [view_06673.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06673.created_at_date: "7 days"]
    unless: [view_06673.id, view_06673.status]
  }

  join: view_06675 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06673.user_id} = ${view_06675.id} ;;
    required_joins: []
  }

  join: view_06676 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06673.account_id} = ${view_06676.account_id} ;;
    required_joins: [view_06675]
  }

  join: view_06677 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06673.category} = ${view_06677.category} ;;
  }

  access_filter: {
    field: view_06673.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06673.is_deleted} = false ;;
}
