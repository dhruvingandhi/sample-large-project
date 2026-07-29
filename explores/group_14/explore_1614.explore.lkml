# Explore: explore_1614
# Auto-generated LookML Explore File

include: "/views/domain_43/view_04843.view.lkml"
include: "/views/domain_45/view_04845.view.lkml"
include: "/views/domain_46/view_04846.view.lkml"
include: "/views/domain_47/view_04847.view.lkml"

explore: explore_1614 {
  label: "Explore Explore 1614"
  description: "Comprehensive analytics explore joining base view_04843 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04843
  
  always_filter: {
    filters: [view_04843.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04843.created_at_date: "7 days"]
    unless: [view_04843.id, view_04843.status]
  }

  join: view_04845 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04843.user_id} = ${view_04845.id} ;;
    required_joins: []
  }

  join: view_04846 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04843.account_id} = ${view_04846.account_id} ;;
    required_joins: [view_04845]
  }

  join: view_04847 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04843.category} = ${view_04847.category} ;;
  }

  access_filter: {
    field: view_04843.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04843.is_deleted} = false ;;
}
