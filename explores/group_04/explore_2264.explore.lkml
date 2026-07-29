# Explore: explore_2264
# Auto-generated LookML Explore File

include: "/views/domain_43/view_06793.view.lkml"
include: "/views/domain_45/view_06795.view.lkml"
include: "/views/domain_46/view_06796.view.lkml"
include: "/views/domain_47/view_06797.view.lkml"

explore: explore_2264 {
  label: "Explore Explore 2264"
  description: "Comprehensive analytics explore joining base view_06793 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06793
  
  always_filter: {
    filters: [view_06793.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06793.created_at_date: "7 days"]
    unless: [view_06793.id, view_06793.status]
  }

  join: view_06795 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06793.user_id} = ${view_06795.id} ;;
    required_joins: []
  }

  join: view_06796 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06793.account_id} = ${view_06796.account_id} ;;
    required_joins: [view_06795]
  }

  join: view_06797 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06793.category} = ${view_06797.category} ;;
  }

  access_filter: {
    field: view_06793.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06793.is_deleted} = false ;;
}
