# Update for 500 file diff target
# Explore: explore_3225
# Auto-generated LookML Explore File

include: "/views/domain_26/view_09676.view.lkml"
include: "/views/domain_28/view_09678.view.lkml"
include: "/views/domain_29/view_09679.view.lkml"
include: "/views/domain_30/view_09680.view.lkml"

explore: explore_3225 {
  label: "Explore Explore 3225"
  description: "Comprehensive analytics explore joining base view_09676 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09676
  
  always_filter: {
    filters: [view_09676.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09676.created_at_date: "7 days"]
    unless: [view_09676.id, view_09676.status]
  }

  join: view_09678 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09676.user_id} = ${view_09678.id} ;;
    required_joins: []
  }

  join: view_09679 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09676.account_id} = ${view_09679.account_id} ;;
    required_joins: [view_09678]
  }

  join: view_09680 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09676.category} = ${view_09680.category} ;;
  }

  access_filter: {
    field: view_09676.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09676.is_deleted} = false ;;
}
