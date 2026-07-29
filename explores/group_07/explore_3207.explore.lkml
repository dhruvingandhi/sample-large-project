# Explore: explore_3207
# Auto-generated LookML Explore File

include: "/views/domain_22/view_09622.view.lkml"
include: "/views/domain_24/view_09624.view.lkml"
include: "/views/domain_25/view_09625.view.lkml"
include: "/views/domain_26/view_09626.view.lkml"

explore: explore_3207 {
  label: "Explore Explore 3207"
  description: "Comprehensive analytics explore joining base view_09622 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09622
  
  always_filter: {
    filters: [view_09622.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09622.created_at_date: "7 days"]
    unless: [view_09622.id, view_09622.status]
  }

  join: view_09624 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09622.user_id} = ${view_09624.id} ;;
    required_joins: []
  }

  join: view_09625 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09622.account_id} = ${view_09625.account_id} ;;
    required_joins: [view_09624]
  }

  join: view_09626 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09622.category} = ${view_09626.category} ;;
  }

  access_filter: {
    field: view_09622.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09622.is_deleted} = false ;;
}
