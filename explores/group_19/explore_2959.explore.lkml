# Update for 2000 file diff target
# Explore: explore_2959
# Auto-generated LookML Explore File

include: "/views/domain_28/view_08878.view.lkml"
include: "/views/domain_30/view_08880.view.lkml"
include: "/views/domain_31/view_08881.view.lkml"
include: "/views/domain_32/view_08882.view.lkml"

explore: explore_2959 {
  label: "Explore Explore 2959"
  description: "Comprehensive analytics explore joining base view_08878 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08878
  
  always_filter: {
    filters: [view_08878.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08878.created_at_date: "7 days"]
    unless: [view_08878.id, view_08878.status]
  }

  join: view_08880 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08878.user_id} = ${view_08880.id} ;;
    required_joins: []
  }

  join: view_08881 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08878.account_id} = ${view_08881.account_id} ;;
    required_joins: [view_08880]
  }

  join: view_08882 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08878.category} = ${view_08882.category} ;;
  }

  access_filter: {
    field: view_08878.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08878.is_deleted} = false ;;
}
