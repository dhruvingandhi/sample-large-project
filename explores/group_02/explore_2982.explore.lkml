# Explore: explore_2982
# Auto-generated LookML Explore File

include: "/views/domain_47/view_08947.view.lkml"
include: "/views/domain_49/view_08949.view.lkml"
include: "/views/domain_50/view_08950.view.lkml"
include: "/views/domain_01/view_08951.view.lkml"

explore: explore_2982 {
  label: "Explore Explore 2982"
  description: "Comprehensive analytics explore joining base view_08947 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08947
  
  always_filter: {
    filters: [view_08947.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08947.created_at_date: "7 days"]
    unless: [view_08947.id, view_08947.status]
  }

  join: view_08949 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08947.user_id} = ${view_08949.id} ;;
    required_joins: []
  }

  join: view_08950 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08947.account_id} = ${view_08950.account_id} ;;
    required_joins: [view_08949]
  }

  join: view_08951 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08947.category} = ${view_08951.category} ;;
  }

  access_filter: {
    field: view_08947.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08947.is_deleted} = false ;;
}
