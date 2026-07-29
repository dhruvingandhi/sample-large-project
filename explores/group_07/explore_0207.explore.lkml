# Explore: explore_0207
# Auto-generated LookML Explore File

include: "/views/domain_22/view_00622.view.lkml"
include: "/views/domain_24/view_00624.view.lkml"
include: "/views/domain_25/view_00625.view.lkml"
include: "/views/domain_26/view_00626.view.lkml"

explore: explore_0207 {
  label: "Explore Explore 0207"
  description: "Comprehensive analytics explore joining base view_00622 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00622
  
  always_filter: {
    filters: [view_00622.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00622.created_at_date: "7 days"]
    unless: [view_00622.id, view_00622.status]
  }

  join: view_00624 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00622.user_id} = ${view_00624.id} ;;
    required_joins: []
  }

  join: view_00625 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00622.account_id} = ${view_00625.account_id} ;;
    required_joins: [view_00624]
  }

  join: view_00626 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00622.category} = ${view_00626.category} ;;
  }

  access_filter: {
    field: view_00622.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00622.is_deleted} = false ;;
}
