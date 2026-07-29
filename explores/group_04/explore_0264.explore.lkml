# Explore: explore_0264
# Auto-generated LookML Explore File

include: "/views/domain_43/view_00793.view.lkml"
include: "/views/domain_45/view_00795.view.lkml"
include: "/views/domain_46/view_00796.view.lkml"
include: "/views/domain_47/view_00797.view.lkml"

explore: explore_0264 {
  label: "Explore Explore 0264"
  description: "Comprehensive analytics explore joining base view_00793 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00793
  
  always_filter: {
    filters: [view_00793.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00793.created_at_date: "7 days"]
    unless: [view_00793.id, view_00793.status]
  }

  join: view_00795 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00793.user_id} = ${view_00795.id} ;;
    required_joins: []
  }

  join: view_00796 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00793.account_id} = ${view_00796.account_id} ;;
    required_joins: [view_00795]
  }

  join: view_00797 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00793.category} = ${view_00797.category} ;;
  }

  access_filter: {
    field: view_00793.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00793.is_deleted} = false ;;
}
