# Explore: explore_0201
# Auto-generated LookML Explore File

include: "/views/domain_04/view_00604.view.lkml"
include: "/views/domain_06/view_00606.view.lkml"
include: "/views/domain_07/view_00607.view.lkml"
include: "/views/domain_08/view_00608.view.lkml"

explore: explore_0201 {
  label: "Explore Explore 0201"
  description: "Comprehensive analytics explore joining base view_00604 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00604
  
  always_filter: {
    filters: [view_00604.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00604.created_at_date: "7 days"]
    unless: [view_00604.id, view_00604.status]
  }

  join: view_00606 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00604.user_id} = ${view_00606.id} ;;
    required_joins: []
  }

  join: view_00607 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00604.account_id} = ${view_00607.account_id} ;;
    required_joins: [view_00606]
  }

  join: view_00608 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00604.category} = ${view_00608.category} ;;
  }

  access_filter: {
    field: view_00604.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00604.is_deleted} = false ;;
}
