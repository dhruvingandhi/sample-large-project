# Explore: explore_2692
# Auto-generated LookML Explore File

include: "/views/domain_27/view_08077.view.lkml"
include: "/views/domain_29/view_08079.view.lkml"
include: "/views/domain_30/view_08080.view.lkml"
include: "/views/domain_31/view_08081.view.lkml"

explore: explore_2692 {
  label: "Explore Explore 2692"
  description: "Comprehensive analytics explore joining base view_08077 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08077
  
  always_filter: {
    filters: [view_08077.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08077.created_at_date: "7 days"]
    unless: [view_08077.id, view_08077.status]
  }

  join: view_08079 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08077.user_id} = ${view_08079.id} ;;
    required_joins: []
  }

  join: view_08080 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08077.account_id} = ${view_08080.account_id} ;;
    required_joins: [view_08079]
  }

  join: view_08081 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08077.category} = ${view_08081.category} ;;
  }

  access_filter: {
    field: view_08077.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08077.is_deleted} = false ;;
}
