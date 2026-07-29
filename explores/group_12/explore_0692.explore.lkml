# Explore: explore_0692
# Auto-generated LookML Explore File

include: "/views/domain_27/view_02077.view.lkml"
include: "/views/domain_29/view_02079.view.lkml"
include: "/views/domain_30/view_02080.view.lkml"
include: "/views/domain_31/view_02081.view.lkml"

explore: explore_0692 {
  label: "Explore Explore 0692"
  description: "Comprehensive analytics explore joining base view_02077 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02077
  
  always_filter: {
    filters: [view_02077.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02077.created_at_date: "7 days"]
    unless: [view_02077.id, view_02077.status]
  }

  join: view_02079 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02077.user_id} = ${view_02079.id} ;;
    required_joins: []
  }

  join: view_02080 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02077.account_id} = ${view_02080.account_id} ;;
    required_joins: [view_02079]
  }

  join: view_02081 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02077.category} = ${view_02081.category} ;;
  }

  access_filter: {
    field: view_02077.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02077.is_deleted} = false ;;
}
