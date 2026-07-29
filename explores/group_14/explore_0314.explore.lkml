# Explore: explore_0314
# Auto-generated LookML Explore File

include: "/views/domain_43/view_00943.view.lkml"
include: "/views/domain_45/view_00945.view.lkml"
include: "/views/domain_46/view_00946.view.lkml"
include: "/views/domain_47/view_00947.view.lkml"

explore: explore_0314 {
  label: "Explore Explore 0314"
  description: "Comprehensive analytics explore joining base view_00943 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00943
  
  always_filter: {
    filters: [view_00943.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00943.created_at_date: "7 days"]
    unless: [view_00943.id, view_00943.status]
  }

  join: view_00945 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00943.user_id} = ${view_00945.id} ;;
    required_joins: []
  }

  join: view_00946 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00943.account_id} = ${view_00946.account_id} ;;
    required_joins: [view_00945]
  }

  join: view_00947 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00943.category} = ${view_00947.category} ;;
  }

  access_filter: {
    field: view_00943.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00943.is_deleted} = false ;;
}
