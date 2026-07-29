# Explore: explore_0323
# Auto-generated LookML Explore File

include: "/views/domain_20/view_00970.view.lkml"
include: "/views/domain_22/view_00972.view.lkml"
include: "/views/domain_23/view_00973.view.lkml"
include: "/views/domain_24/view_00974.view.lkml"

explore: explore_0323 {
  label: "Explore Explore 0323"
  description: "Comprehensive analytics explore joining base view_00970 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00970
  
  always_filter: {
    filters: [view_00970.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00970.created_at_date: "7 days"]
    unless: [view_00970.id, view_00970.status]
  }

  join: view_00972 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00970.user_id} = ${view_00972.id} ;;
    required_joins: []
  }

  join: view_00973 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00970.account_id} = ${view_00973.account_id} ;;
    required_joins: [view_00972]
  }

  join: view_00974 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00970.category} = ${view_00974.category} ;;
  }

  access_filter: {
    field: view_00970.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00970.is_deleted} = false ;;
}
