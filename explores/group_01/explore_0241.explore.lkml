# Explore: explore_0241
# Auto-generated LookML Explore File

include: "/views/domain_24/view_00724.view.lkml"
include: "/views/domain_26/view_00726.view.lkml"
include: "/views/domain_27/view_00727.view.lkml"
include: "/views/domain_28/view_00728.view.lkml"

explore: explore_0241 {
  label: "Explore Explore 0241"
  description: "Comprehensive analytics explore joining base view_00724 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00724
  
  always_filter: {
    filters: [view_00724.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00724.created_at_date: "7 days"]
    unless: [view_00724.id, view_00724.status]
  }

  join: view_00726 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00724.user_id} = ${view_00726.id} ;;
    required_joins: []
  }

  join: view_00727 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00724.account_id} = ${view_00727.account_id} ;;
    required_joins: [view_00726]
  }

  join: view_00728 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00724.category} = ${view_00728.category} ;;
  }

  access_filter: {
    field: view_00724.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00724.is_deleted} = false ;;
}
