# Update for 2000 file diff target
# Explore: explore_1659
# Auto-generated LookML Explore File

include: "/views/domain_28/view_04978.view.lkml"
include: "/views/domain_30/view_04980.view.lkml"
include: "/views/domain_31/view_04981.view.lkml"
include: "/views/domain_32/view_04982.view.lkml"

explore: explore_1659 {
  label: "Explore Explore 1659"
  description: "Comprehensive analytics explore joining base view_04978 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04978
  
  always_filter: {
    filters: [view_04978.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04978.created_at_date: "7 days"]
    unless: [view_04978.id, view_04978.status]
  }

  join: view_04980 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04978.user_id} = ${view_04980.id} ;;
    required_joins: []
  }

  join: view_04981 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04978.account_id} = ${view_04981.account_id} ;;
    required_joins: [view_04980]
  }

  join: view_04982 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04978.category} = ${view_04982.category} ;;
  }

  access_filter: {
    field: view_04978.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04978.is_deleted} = false ;;
}
