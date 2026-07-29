# Explore: explore_1616
# Auto-generated LookML Explore File

include: "/views/domain_49/view_04849.view.lkml"
include: "/views/domain_01/view_04851.view.lkml"
include: "/views/domain_02/view_04852.view.lkml"
include: "/views/domain_03/view_04853.view.lkml"

explore: explore_1616 {
  label: "Explore Explore 1616"
  description: "Comprehensive analytics explore joining base view_04849 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04849
  
  always_filter: {
    filters: [view_04849.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04849.created_at_date: "7 days"]
    unless: [view_04849.id, view_04849.status]
  }

  join: view_04851 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04849.user_id} = ${view_04851.id} ;;
    required_joins: []
  }

  join: view_04852 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04849.account_id} = ${view_04852.account_id} ;;
    required_joins: [view_04851]
  }

  join: view_04853 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04849.category} = ${view_04853.category} ;;
  }

  access_filter: {
    field: view_04849.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04849.is_deleted} = false ;;
}
