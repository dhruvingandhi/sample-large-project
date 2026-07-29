# Explore: explore_3264
# Auto-generated LookML Explore File

include: "/views/domain_43/view_09793.view.lkml"
include: "/views/domain_45/view_09795.view.lkml"
include: "/views/domain_46/view_09796.view.lkml"
include: "/views/domain_47/view_09797.view.lkml"

explore: explore_3264 {
  label: "Explore Explore 3264"
  description: "Comprehensive analytics explore joining base view_09793 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09793
  
  always_filter: {
    filters: [view_09793.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09793.created_at_date: "7 days"]
    unless: [view_09793.id, view_09793.status]
  }

  join: view_09795 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09793.user_id} = ${view_09795.id} ;;
    required_joins: []
  }

  join: view_09796 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09793.account_id} = ${view_09796.account_id} ;;
    required_joins: [view_09795]
  }

  join: view_09797 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09793.category} = ${view_09797.category} ;;
  }

  access_filter: {
    field: view_09793.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09793.is_deleted} = false ;;
}
