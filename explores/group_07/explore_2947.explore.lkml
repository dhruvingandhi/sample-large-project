# Explore: explore_2947
# Auto-generated LookML Explore File

include: "/views/domain_42/view_08842.view.lkml"
include: "/views/domain_44/view_08844.view.lkml"
include: "/views/domain_45/view_08845.view.lkml"
include: "/views/domain_46/view_08846.view.lkml"

explore: explore_2947 {
  label: "Explore Explore 2947"
  description: "Comprehensive analytics explore joining base view_08842 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08842
  
  always_filter: {
    filters: [view_08842.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08842.created_at_date: "7 days"]
    unless: [view_08842.id, view_08842.status]
  }

  join: view_08844 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08842.user_id} = ${view_08844.id} ;;
    required_joins: []
  }

  join: view_08845 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08842.account_id} = ${view_08845.account_id} ;;
    required_joins: [view_08844]
  }

  join: view_08846 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08842.category} = ${view_08846.category} ;;
  }

  access_filter: {
    field: view_08842.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08842.is_deleted} = false ;;
}
