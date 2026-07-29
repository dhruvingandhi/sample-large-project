# Explore: explore_0197
# Auto-generated LookML Explore File

include: "/views/domain_42/view_00592.view.lkml"
include: "/views/domain_44/view_00594.view.lkml"
include: "/views/domain_45/view_00595.view.lkml"
include: "/views/domain_46/view_00596.view.lkml"

explore: explore_0197 {
  label: "Explore Explore 0197"
  description: "Comprehensive analytics explore joining base view_00592 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00592
  
  always_filter: {
    filters: [view_00592.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00592.created_at_date: "7 days"]
    unless: [view_00592.id, view_00592.status]
  }

  join: view_00594 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00592.user_id} = ${view_00594.id} ;;
    required_joins: []
  }

  join: view_00595 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00592.account_id} = ${view_00595.account_id} ;;
    required_joins: [view_00594]
  }

  join: view_00596 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00592.category} = ${view_00596.category} ;;
  }

  access_filter: {
    field: view_00592.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00592.is_deleted} = false ;;
}
