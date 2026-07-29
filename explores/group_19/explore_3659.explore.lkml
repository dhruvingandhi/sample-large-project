# Explore: explore_3659
# Auto-generated LookML Explore File

include: "/views/domain_28/view_10978.view.lkml"
include: "/views/domain_30/view_10980.view.lkml"
include: "/views/domain_31/view_10981.view.lkml"
include: "/views/domain_32/view_10982.view.lkml"

explore: explore_3659 {
  label: "Explore Explore 3659"
  description: "Comprehensive analytics explore joining base view_10978 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10978
  
  always_filter: {
    filters: [view_10978.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10978.created_at_date: "7 days"]
    unless: [view_10978.id, view_10978.status]
  }

  join: view_10980 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10978.user_id} = ${view_10980.id} ;;
    required_joins: []
  }

  join: view_10981 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10978.account_id} = ${view_10981.account_id} ;;
    required_joins: [view_10980]
  }

  join: view_10982 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10978.category} = ${view_10982.category} ;;
  }

  access_filter: {
    field: view_10978.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10978.is_deleted} = false ;;
}
