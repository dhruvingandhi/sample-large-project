# Update for 500 file diff target
# Explore: explore_1625
# Auto-generated LookML Explore File

include: "/views/domain_26/view_04876.view.lkml"
include: "/views/domain_28/view_04878.view.lkml"
include: "/views/domain_29/view_04879.view.lkml"
include: "/views/domain_30/view_04880.view.lkml"

explore: explore_1625 {
  label: "Explore Explore 1625"
  description: "Comprehensive analytics explore joining base view_04876 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04876
  
  always_filter: {
    filters: [view_04876.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04876.created_at_date: "7 days"]
    unless: [view_04876.id, view_04876.status]
  }

  join: view_04878 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04876.user_id} = ${view_04878.id} ;;
    required_joins: []
  }

  join: view_04879 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04876.account_id} = ${view_04879.account_id} ;;
    required_joins: [view_04878]
  }

  join: view_04880 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04876.category} = ${view_04880.category} ;;
  }

  access_filter: {
    field: view_04876.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04876.is_deleted} = false ;;
}
