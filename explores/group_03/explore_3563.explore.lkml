# Explore: explore_3563
# Auto-generated LookML Explore File

include: "/views/domain_40/view_10690.view.lkml"
include: "/views/domain_42/view_10692.view.lkml"
include: "/views/domain_43/view_10693.view.lkml"
include: "/views/domain_44/view_10694.view.lkml"

explore: explore_3563 {
  label: "Explore Explore 3563"
  description: "Comprehensive analytics explore joining base view_10690 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10690
  
  always_filter: {
    filters: [view_10690.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10690.created_at_date: "7 days"]
    unless: [view_10690.id, view_10690.status]
  }

  join: view_10692 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10690.user_id} = ${view_10692.id} ;;
    required_joins: []
  }

  join: view_10693 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10690.account_id} = ${view_10693.account_id} ;;
    required_joins: [view_10692]
  }

  join: view_10694 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10690.category} = ${view_10694.category} ;;
  }

  access_filter: {
    field: view_10690.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10690.is_deleted} = false ;;
}
