# Update for 2000 file diff target
# Explore: explore_2930
# Auto-generated LookML Explore File

include: "/views/domain_41/view_08791.view.lkml"
include: "/views/domain_43/view_08793.view.lkml"
include: "/views/domain_44/view_08794.view.lkml"
include: "/views/domain_45/view_08795.view.lkml"

explore: explore_2930 {
  label: "Explore Explore 2930"
  description: "Comprehensive analytics explore joining base view_08791 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08791
  
  always_filter: {
    filters: [view_08791.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08791.created_at_date: "7 days"]
    unless: [view_08791.id, view_08791.status]
  }

  join: view_08793 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08791.user_id} = ${view_08793.id} ;;
    required_joins: []
  }

  join: view_08794 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08791.account_id} = ${view_08794.account_id} ;;
    required_joins: [view_08793]
  }

  join: view_08795 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08791.category} = ${view_08795.category} ;;
  }

  access_filter: {
    field: view_08791.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08791.is_deleted} = false ;;
}
