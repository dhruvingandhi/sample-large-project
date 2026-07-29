# Explore: explore_0930
# Auto-generated LookML Explore File

include: "/views/domain_41/view_02791.view.lkml"
include: "/views/domain_43/view_02793.view.lkml"
include: "/views/domain_44/view_02794.view.lkml"
include: "/views/domain_45/view_02795.view.lkml"

explore: explore_0930 {
  label: "Explore Explore 0930"
  description: "Comprehensive analytics explore joining base view_02791 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02791
  
  always_filter: {
    filters: [view_02791.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02791.created_at_date: "7 days"]
    unless: [view_02791.id, view_02791.status]
  }

  join: view_02793 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02791.user_id} = ${view_02793.id} ;;
    required_joins: []
  }

  join: view_02794 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02791.account_id} = ${view_02794.account_id} ;;
    required_joins: [view_02793]
  }

  join: view_02795 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02791.category} = ${view_02795.category} ;;
  }

  access_filter: {
    field: view_02791.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02791.is_deleted} = false ;;
}
