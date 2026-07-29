# Explore: explore_2201
# Auto-generated LookML Explore File

include: "/views/domain_04/view_06604.view.lkml"
include: "/views/domain_06/view_06606.view.lkml"
include: "/views/domain_07/view_06607.view.lkml"
include: "/views/domain_08/view_06608.view.lkml"

explore: explore_2201 {
  label: "Explore Explore 2201"
  description: "Comprehensive analytics explore joining base view_06604 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06604
  
  always_filter: {
    filters: [view_06604.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06604.created_at_date: "7 days"]
    unless: [view_06604.id, view_06604.status]
  }

  join: view_06606 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06604.user_id} = ${view_06606.id} ;;
    required_joins: []
  }

  join: view_06607 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06604.account_id} = ${view_06607.account_id} ;;
    required_joins: [view_06606]
  }

  join: view_06608 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06604.category} = ${view_06608.category} ;;
  }

  access_filter: {
    field: view_06604.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06604.is_deleted} = false ;;
}
