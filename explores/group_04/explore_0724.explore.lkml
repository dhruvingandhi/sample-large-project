# Explore: explore_0724
# Auto-generated LookML Explore File

include: "/views/domain_23/view_02173.view.lkml"
include: "/views/domain_25/view_02175.view.lkml"
include: "/views/domain_26/view_02176.view.lkml"
include: "/views/domain_27/view_02177.view.lkml"

explore: explore_0724 {
  label: "Explore Explore 0724"
  description: "Comprehensive analytics explore joining base view_02173 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02173
  
  always_filter: {
    filters: [view_02173.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02173.created_at_date: "7 days"]
    unless: [view_02173.id, view_02173.status]
  }

  join: view_02175 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02173.user_id} = ${view_02175.id} ;;
    required_joins: []
  }

  join: view_02176 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02173.account_id} = ${view_02176.account_id} ;;
    required_joins: [view_02175]
  }

  join: view_02177 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02173.category} = ${view_02177.category} ;;
  }

  access_filter: {
    field: view_02173.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02173.is_deleted} = false ;;
}
