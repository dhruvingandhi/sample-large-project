# Update for 2000 file diff target
# Explore: explore_2578
# Auto-generated LookML Explore File

include: "/views/domain_35/view_07735.view.lkml"
include: "/views/domain_37/view_07737.view.lkml"
include: "/views/domain_38/view_07738.view.lkml"
include: "/views/domain_39/view_07739.view.lkml"

explore: explore_2578 {
  label: "Explore Explore 2578"
  description: "Comprehensive analytics explore joining base view_07735 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07735
  
  always_filter: {
    filters: [view_07735.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07735.created_at_date: "7 days"]
    unless: [view_07735.id, view_07735.status]
  }

  join: view_07737 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07735.user_id} = ${view_07737.id} ;;
    required_joins: []
  }

  join: view_07738 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07735.account_id} = ${view_07738.account_id} ;;
    required_joins: [view_07737]
  }

  join: view_07739 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07735.category} = ${view_07739.category} ;;
  }

  access_filter: {
    field: view_07735.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07735.is_deleted} = false ;;
}
