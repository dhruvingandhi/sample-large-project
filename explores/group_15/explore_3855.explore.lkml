# Explore: explore_3855
# Auto-generated LookML Explore File

include: "/views/domain_16/view_11566.view.lkml"
include: "/views/domain_18/view_11568.view.lkml"
include: "/views/domain_19/view_11569.view.lkml"
include: "/views/domain_20/view_11570.view.lkml"

explore: explore_3855 {
  label: "Explore Explore 3855"
  description: "Comprehensive analytics explore joining base view_11566 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11566
  
  always_filter: {
    filters: [view_11566.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11566.created_at_date: "7 days"]
    unless: [view_11566.id, view_11566.status]
  }

  join: view_11568 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11566.user_id} = ${view_11568.id} ;;
    required_joins: []
  }

  join: view_11569 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11566.account_id} = ${view_11569.account_id} ;;
    required_joins: [view_11568]
  }

  join: view_11570 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11566.category} = ${view_11570.category} ;;
  }

  access_filter: {
    field: view_11566.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11566.is_deleted} = false ;;
}
