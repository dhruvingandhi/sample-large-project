# Explore: explore_3947
# Auto-generated LookML Explore File

include: "/views/domain_42/view_11842.view.lkml"
include: "/views/domain_44/view_11844.view.lkml"
include: "/views/domain_45/view_11845.view.lkml"
include: "/views/domain_46/view_11846.view.lkml"

explore: explore_3947 {
  label: "Explore Explore 3947"
  description: "Comprehensive analytics explore joining base view_11842 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11842
  
  always_filter: {
    filters: [view_11842.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11842.created_at_date: "7 days"]
    unless: [view_11842.id, view_11842.status]
  }

  join: view_11844 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11842.user_id} = ${view_11844.id} ;;
    required_joins: []
  }

  join: view_11845 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11842.account_id} = ${view_11845.account_id} ;;
    required_joins: [view_11844]
  }

  join: view_11846 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11842.category} = ${view_11846.category} ;;
  }

  access_filter: {
    field: view_11842.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11842.is_deleted} = false ;;
}
