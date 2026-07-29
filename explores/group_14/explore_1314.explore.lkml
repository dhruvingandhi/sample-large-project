# Explore: explore_1314
# Auto-generated LookML Explore File

include: "/views/domain_43/view_03943.view.lkml"
include: "/views/domain_45/view_03945.view.lkml"
include: "/views/domain_46/view_03946.view.lkml"
include: "/views/domain_47/view_03947.view.lkml"

explore: explore_1314 {
  label: "Explore Explore 1314"
  description: "Comprehensive analytics explore joining base view_03943 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03943
  
  always_filter: {
    filters: [view_03943.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03943.created_at_date: "7 days"]
    unless: [view_03943.id, view_03943.status]
  }

  join: view_03945 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03943.user_id} = ${view_03945.id} ;;
    required_joins: []
  }

  join: view_03946 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03943.account_id} = ${view_03946.account_id} ;;
    required_joins: [view_03945]
  }

  join: view_03947 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03943.category} = ${view_03947.category} ;;
  }

  access_filter: {
    field: view_03943.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03943.is_deleted} = false ;;
}
