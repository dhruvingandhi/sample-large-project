# Explore: explore_3991
# Auto-generated LookML Explore File

include: "/views/domain_24/view_11974.view.lkml"
include: "/views/domain_26/view_11976.view.lkml"
include: "/views/domain_27/view_11977.view.lkml"
include: "/views/domain_28/view_11978.view.lkml"

explore: explore_3991 {
  label: "Explore Explore 3991"
  description: "Comprehensive analytics explore joining base view_11974 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11974
  
  always_filter: {
    filters: [view_11974.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11974.created_at_date: "7 days"]
    unless: [view_11974.id, view_11974.status]
  }

  join: view_11976 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11974.user_id} = ${view_11976.id} ;;
    required_joins: []
  }

  join: view_11977 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11974.account_id} = ${view_11977.account_id} ;;
    required_joins: [view_11976]
  }

  join: view_11978 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11974.category} = ${view_11978.category} ;;
  }

  access_filter: {
    field: view_11974.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11974.is_deleted} = false ;;
}
